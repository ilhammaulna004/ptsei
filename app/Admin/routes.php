<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    // $router->get('/', 'HomeController@index')->name('home');
    $router->resource('/customer', CustomerControllers::class);
    $router->resource('/jasa', JasaControllers::class);
    $router->resource('/job-order', JobOrderControllers::class);

    $router->post('/job-order/store', 'JobOrderControllers@store')->name('job_order.store');
    $router->post('/job-order/update/{id}', 'JobOrderControllers@update')->name('job_order.update');
    
    $router->resource('/job-order-detail', JobOrderDetailControllers::class);

});
