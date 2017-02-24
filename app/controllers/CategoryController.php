<?php

class CategoryController extends ControllerBase
{

    public function newsListAction()
    {
        $category = $this->dispatcher->getParam('categoryId');



        $news = $this->modelsManager->createBuilder()
            ->from("News")
            ->columns(['cat_id', 'photo', 'title', 'description', 'url', 'News.date', 'login'])
            ->join("Users", "News.user_id = Users.id")
            ->where("cat_id = :cat_id:", ["cat_id" => $category])
            ->orderBy('News.date DESC')
            ->getQuery()
            ->execute();

        $this->view->setVar('news', $news);

    }

}