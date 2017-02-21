<?php


$di->set('router', function () {

    $router = new \Phalcon\Mvc\Router(false);

    $router->removeExtraSlashes(true)
        ->mount(new AppRouter());

    return $router;

});