<?php

/**
 * Created by PhpStorm.
 * User: Marta_Forrel
 * Date: 23.01.2017
 * Time: 15:12
 */
class AppRouter extends \Phalcon\Mvc\Router\Group
{
    public function initialize()
    {

        $this->setPaths([
            'controller' => 'Index',
            'action' => 'Index',
        ]);

        $this->add('');

        $this->add('/');

        $this->add('/:controller', [
            'controller' => 1,
        ])->convert('controller', function ($controller) {
            return \Phalcon\Text::camelize($controller);
        });

        $this->add('/:controller/:action', [
            'controller' => 1,
            'action' => 2,
        ])->convert('controller', function ($controller) {
            return \Phalcon\Text::camelize($controller);
        })->convert('action', function ($action) {
            return \Phalcon\Text::camelize($action);
        });

        $this->add('/:controller/:action/:params', [
            'controller' => 1,
            'action' => 2,
            'params' => 3,
        ])->convert('controller', function ($controller) {
            return \Phalcon\Text::camelize($controller);
        })->convert('action', function ($action) {
            return \Phalcon\Text::camelize($action);
        });

        $this->CatRoutes();
    }

    private function CatRoutes()
    {
        $Categories = Category::query()->columns(['id', 'url'])->execute();

        foreach ($Categories as $category) {

            $url = $category['url'];

            $this->add("/{$url}", [
                'controller' => 'Category',
                'action' => 'NewsList',
                'categoryId' => $category['id'],
            ]);

            $this->add("/{$url}/([a-z\\-0-9]+)", [
                'controller' => 'News',
                'action' => 'Detail',
                'category' => $category,
                'slug' => 1,
            ]);


        }

    }
}