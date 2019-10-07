<?php

use yii\helpers\Html;
use yii\widgets\Menu;
use yii\widgets\Breadcrumbs;
use app\themes\adminLTE\components\ThemeNav;

//include mimin
use hscstudio\mimin\components\Mimin;

?>

<?php $this->beginContent('@app/themes/adminLTE/layouts/main.php'); ?>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

     <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<?php echo Yii::$app->request->baseUrl; ?>/images/user_accounts.png" class="img-circle" alt="User Image" />
                </div>
                <div class="pull-left info">
                    <p>
                      <?php
                          $info[] = Yii::t('app','Hello');

                          if(isset(Yii::$app->user->identity->username))
                              $info[] = ucfirst(\Yii::$app->user->identity->username);

                          echo implode(', ', $info);
                      ?>
                    </p>
                    <a><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <?php
              // $menuItems = [
              //     ['label'=>Yii::t('app','MAIN NAVIGITION'), 'options'=>['class'=>'header']],
              //     ['label' => ThemeNav::link('Home', 'fa fa-dashboard'), 'url' => ['/site/index']],
              //     ['label' => ThemeNav::link('About', 'fa fa-dashboard'), 'url' => ['/site/about']],

              //     ['label' => ThemeNav::link('About 2', 'fa fa-dashboard'), 
              //       'url' => '#',
              //       'items' => [
              //         ['label' => ThemeNav::link('About 22', 'fa fa-dashboard'), 'url' => ['/site/about']],
              //       ]
              //     ],
              //     // ['label' => 'About2', 'url' => ['/site/about2']],
              //     // ['label' => 'Contact', 'url' => ['/site/contact']],
              // ];

              $menuItems = [
                    ['label'=>Yii::t('app','MAIN NAVIGITION'), 'options'=>['class'=>'header']],
                    ['label' => ThemeNav::link('Home', 'fa fa-book'), 'url' => ['/site/index']],
                    ['label' => ThemeNav::link('About', 'fa fa-bullhorn'), 'url' => ['/site/about']],
                    ['label' => ThemeNav::link('Mimin', 'fa fa-group'),  
                        'url' => ['#'],
                        'template' => '<a href="{url}" >{label}<i class="fa fa-angle-left pull-right"></i></a>',
                        'items' => [
                            ['label' => ThemeNav::link('User', 'fa fa-user'), 'url' => ['/mimin/user']],
                            ['label' => ThemeNav::link('Route', 'fa fa-circle-o'), 'url' => ['/mimin/route']],
                            ['label' => ThemeNav::link('Role', 'fa fa-adjust'), 'url' => ['/mimin/role']],
                            // ['label' => 'Another action', 'url' => '#'],
                            // ['label' => 'Something else here', 'url' => '#'],
                        ],
                    ],

                    ['label' => ThemeNav::link('Multilevel', 'fa fa-circle'), 'url' => '#', 
                        'template' => '<a href="{url}" >{label}<i class="fa fa-angle-left pull-right"></i></a>',
                        'items'=>[
                          ['label' => ThemeNav::link('Level 2', 'fa fa-archive'), 'url' => '#', 'icon' => 'fa fa-angle-right',
                            'template' => '<a href="{url}" >{label}<i class="fa fa-angle-left pull-right"></i></a>',
                            'items'=>[
                              ['label' => ThemeNav::link('Sub Level 22', 'fa fa-bell-o'), 'url' => '#', 
                                'template' => '<a href="{url}" >{label}<i class="fa fa-angle-left pull-right"></i></a>',
                                'items'=>[
                                  // ['label' => 'Sub Level', 'url' => '#', 'icon' => 'fa fa-angle-right'],
                                  ['label' => ThemeNav::link('Sub Level 221', 'fa fa-bullhorn'), 'url' => '#'],
                                  ['label' => ThemeNav::link('Sub Level 222', 'fa fa-bullhorn'), 'url' => '#'],
                                ]
                              ],
                              ['label' => ThemeNav::link('Sub Level 23', 'fa fa-bullhorn'), 'url' => '#'],
                            ]
                          ],
                          ['label' => ThemeNav::link('Level 3', 'fa fa-archive'), 'url' => '#', 'icon' => 'fa fa-angle-right'],
                        ]
                    ],

              ];
              $menuItems = Mimin::filterMenu($menuItems);

              // https://stackoverflow.com/questions/30177703/yii2-nav-widget-submenu-class
              echo Menu::widget([
                      'encodeLabels'=>false,
                      'submenuTemplate' => "\n<ul class='treeview-menu'>\n{items}\n</ul>\n",
                      'activateParents' => true,
                        'options' => [
                            // 'class' => 'sidebar-menu',
                            'class' => 'sidebar-menu treeview',
                        ],
                        'items' => $menuItems,
                    ]);
            ?>
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <?php
              
                // echo Menu::widget([
                //   'encodeLabels'=>false,
                //   'options' => [
                //     'class' => 'sidebar-menu'
                //   ],
                //   'items' => [
                //       ['label'=>Yii::t('app','MAIN NAVIGITION'), 'options'=>['class'=>'header']],
                //       ['label' => ThemeNav::link('Dashboard', 'fa fa-dashboard'), 
                //           'url' => ['site/index'], 
                //           'visible'=>!Yii::$app->user->isGuest
                //       ],
                //       ['label' => ThemeNav::link('Dashboard', 'fa fa-dashboard'), 'url' => ['mimin/route'], 'visible'=>!Yii::$app->user->isGuest],
                //   ],
                // ]);
            ?>

        </section>
  <!-- /.sidebar -->
</aside>

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">

   <!-- Content Header (Page header) -->
   <section class="content-header">
        <h1> <?php echo Html::encode($this->title); ?> </h1>
           <?= Breadcrumbs::widget([
                'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
            ]) ?>
    </section>

    <!-- Main content -->
    <section class="content">
        <?php echo $content; ?>
    </section><!-- /.content -->

</div><!-- /.right-side -->
<?php $this->endContent();