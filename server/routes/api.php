<?php

Route::get('user', function () {
    return request()->user();
})->middleware('auth:api');

Route::group(['middleware' => 'admin:api'], function () {
    // get all orders
    Route::get('all/orders', 'OrdersController@getAllOrders');
    // order update status
    Route::post('update/status/order', 'OrdersController@updStatus');
    //add insurance
    Route::post('add/insurance', 'InsuranceController@addInsurance');
    //get users
    Route::get('users', 'UserController@getUsers');
    //add agent
    Route::post('add/agent', 'AgentController@addAgent');
    //update status user
    Route::post('status', 'UserController@updateStatus');
});

Route::group(['middleware' => 'moder:api'], function () {
    //update insurance text by id
    Route::post('insurance/{id}', 'InsuranceController@updateText');
    //add insurance
    Route::post('add/insurance', 'InsuranceController@addInsurance');
});
Route::group(['middleware' => 'auth:api'], function () {
    // create order
    Route::post('orders', 'OrdersController@createOrder');
    // get orders by user
    Route::get('orders/{id}', 'OrdersController@getOrdersByUser');
});

// auth register
Route::post('register', 'AuthController@register');
// get agents
Route::get('agents', 'AgentController@getAllAgents');
// get insurance
Route::get('insurance', 'InsuranceController@getAllInsurance');
//get info insurance by id
Route::get('insurance/{id}', 'InsuranceController@getInsuranceById');


