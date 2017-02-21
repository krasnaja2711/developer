<?php

class CategoryController extends ControllerBase
{

    public function newsListAction()
    {
        $category = $this->dispatcher->getParam('categoryId');

        $news = News::find([
            'conditions' => 'cat_id = :cat_id:',
            'bind' => [
                'cat_id' => $category,
            ],
            'order' => 'date DESC'
        ]);

        $this->view->setVar('news', $news);

    }

}