Yii2-mimin with AdminLTE

Step 1 :
change file config/db.php with this

	return [
		'class' => 'yii\db\Connection',
		'dsn' => 'mysql:host=localhost;dbname=hardb',
		'username' => 'jimmy',
		'password' => '',
		'charset' => 'utf8',
		'tablePrefix' => 'tbl_',
	];


Step 2 :
create table user and user access with this link 
https://devreadwrite.com/posts/yii2-basic-authorization-and-registration-via-the-database

$ yii migrate/create create_user_table

Open the file with the migration /migration/m000000_000000_create_user_table.php and add the code for creating the migration, we will not reinvent the wheel, and we will do the same as in the version advanced:

    <?php
     
    use yii\db\Migration;
     
    class m000000_000000_create_user_table extends Migration
    {
     
        public function up()
        {
            $tableOptions = null;
     
            if ($this->db->driverName === 'mysql') {
                $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
            }
     
            $this->createTable('user', [
                'id' => $this->primaryKey(),
                'username' => $this->string()->notNull()->unique(),
                'auth_key' => $this->string(32)->notNull(),
                'password_hash' => $this->string()->notNull(),
                'password_reset_token' => $this->string()->unique(),
                'email' => $this->string()->notNull()->unique(),
                'status' => $this->smallInteger()->notNull()->defaultValue(10),
                'created_at' => $this->integer()->notNull(),
                'updated_at' => $this->integer()->notNull(),
            ], $tableOptions);
        }
     
        public function down()
        {
            $this->dropTable('user');
        }
     
    }

execute : 
$ yii migrate
    
Edit model /models/User.php: 
    <?php
     
    namespace app\models;
     
    use Yii;
    use yii\base\NotSupportedException;
    use yii\behaviors\TimestampBehavior;
    use yii\db\ActiveRecord;
    use yii\web\IdentityInterface;
     
    /**
     * User model
     *
     * @property integer $id
     * @property string $username
     * @property string $password_hash
     * @property string $password_reset_token
     * @property string $email
     * @property string $auth_key
     * @property integer $status
     * @property integer $created_at
     * @property integer $updated_at
     * @property string $password write-only password
     */
    class User extends ActiveRecord implements IdentityInterface
    {
        const STATUS_DELETED = 0;
        const STATUS_ACTIVE = 10;
     
        /**
         * @inheritdoc
         */
        public static function tableName()
        {
            return '{{%user}}';
        }
     
        /**
         * @inheritdoc
         */
        public function behaviors()
        {
            return [
                TimestampBehavior::className(),
            ];
        }
     
        /**
         * @inheritdoc
         */
        public function rules()
        {
            return [
                ['status', 'default', 'value' => self::STATUS_ACTIVE],
                ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],
            ];
        }
     
        /**
         * @inheritdoc
         */
        public static function findIdentity($id)
        {
            return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
        }
     
        /**
         * @inheritdoc
         */
        public static function findIdentityByAccessToken($token, $type = null)
        {
            throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
        }
     
        /**
         * Finds user by username
         *
         * @param string $username
         * @return static|null
         */
        public static function findByUsername($username)
        {
            return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
        }
     
        /**
         * @inheritdoc
         */
        public function getId()
        {
            return $this->getPrimaryKey();
        }
     
        /**
         * @inheritdoc
         */
        public function getAuthKey()
        {
            return $this->auth_key;
        }
     
        /**
         * @inheritdoc
         */
        public function validateAuthKey($authKey)
        {
            return $this->getAuthKey() === $authKey;
        }
     
        /**
         * Validates password
         *
         * @param string $password password to validate
         * @return bool if password provided is valid for current user
         */
        public function validatePassword($password)
        {
            return Yii::$app->security->validatePassword($password, $this->password_hash);
        }
     
        /**
         * Generates password hash from password and sets it to the model
         *
         * @param string $password
         */
        public function setPassword($password)
        {
            $this->password_hash = Yii::$app->security->generatePasswordHash($password);
        }
     
        /**
         * Generates "remember me" authentication key
         */
        public function generateAuthKey()
        {
            $this->auth_key = Yii::$app->security->generateRandomString();
        }
     
    }
    
    
Authorization is ready, now we will add a user to check authorization. Open the controller /controllers/SiteController.php and add the action to the end of the controller which will help us add the user: 

    public function actionAddAdmin() {
        $model = User::find()->where(['username' => 'system'])->one();
        if (empty($model)) {
            $user = new User();
            $user->username = 'system';
            $user->email = 'system@ethaner.com';
            $user->setPassword('11111111');
            $user->generateAuthKey();
            if ($user->save()) {
                echo 'good '.$user->username;
            }
        }
    }
    
Run the action: site.com/web/index.php?r=site/add-admin and check the authorization site.com/web/index.php?r=site/login

After successful authorization, the AddAdmin action can be deleted as a useless item.

If you only need authorization via a database in Yii2 basic, then you can end this. If in addition to authorizing through the database on the site you need to add registration and password recovery, then continue. 
    


Step 3 :
install and setup Yii2-mimin 
https://github.com/hscstudio/yii2-mimin


Step 4 :
setup AdminLTE
https://github.com/bmsrox/baseapp-yii2basic-adminlte

