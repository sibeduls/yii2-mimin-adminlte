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

https://www.codepolitan.com/memulai-pembuatan-aplikasi-web-dengan-yii2-autentikasi-ke-database-mysql
https://devreadwrite.com/posts/yii2-basic-authorization-and-registration-via-the-database


Step 3 :
install and setup Yii2-mimin 
https://github.com/hscstudio/yii2-mimin

Step 4 :
setup AdminLTE
https://github.com/bmsrox/baseapp-yii2basic-adminlte

