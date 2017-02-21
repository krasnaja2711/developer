<?php
use Phalcon\Di\FactoryDefault;
use \Phalcon\Mvc\Dispatcher as PhDispatcher;
use Phalcon\Session\Adapter\Files as Session;
use Phalcon\Session\Adapter\Files as Cookies;

error_reporting(E_ALL);

define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');

try {

    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new FactoryDefault();

    /**
     * Read services
     */
    include APP_PATH . "/config/services.php";

    /**
     * Get config service for use in inline setup below
     */
    $config = $di->getConfig();

    /**
     * Include Autoloader
     */
    include APP_PATH . '/config/loader.php';


    include(__DIR__."/../app/config/routes.php");


    $di->setShared(
        "session",
        function () {
            $session = new Session();

            $session->start();

            return $session;
        }
    );

    $di->set('cookies', function() {
        $cookies = new Phalcon\Http\Response\Cookies();
        $cookies->useEncryption(true);
        return $cookies;
    });

    $di->set('crypt', function() {
        $crypt = new Phalcon\Crypt();
        $crypt->setKey('#_+//*(*&eA|;76$');
        return $crypt;
    });
    /**
     * Errors Exception
     */
    $di->set(
        'dispatcher',
        function() use ($di) {

            $evManager = $di->getShared('eventsManager');

            $evManager->attach(
                "dispatch:beforeException",
                function($event, $dispatcher, $exception)
                {
                    switch ($exception->getCode()) {
                        case PhDispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                        case PhDispatcher::EXCEPTION_ACTION_NOT_FOUND:
                            $dispatcher->forward(
                                array(
                                    'controller' => 'error',
                                    'action'     => 'show404',
                                )
                            );
                            return false;
                    }
                }
            );
            $dispatcher = new PhDispatcher();
            $dispatcher->setEventsManager($evManager);
            return $dispatcher;
        },
        true
    );
    /**
     * Handle the request
     */
    $application = new \Phalcon\Mvc\Application($di);

    echo $application->handle()->getContent();

} catch (\Exception $e) {
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
