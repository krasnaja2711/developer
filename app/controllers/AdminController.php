<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class AdminController extends ControllerBase
{

    public function initialize()
    {
        $avrz = $this->session->get("authorization");
        if ($avrz===1) {
            $authorization = $this->session->get('authorization');
            $this->cookies->set('remember-me', $authorization, time()+600);
        }
        else {
            $this->response->redirect('/index');
        }
    }

    public function indexAction()
    {
        $currentPage = (int) $_GET["page"];
        $Categories = Category::find();
        $News = News::find(["order" => "date DESC"]);
        $paginator = new PaginatorModel(
            [
                "data"  => $News,
                "limit" => 1,
                "page"  => $currentPage,
            ]
        );
        $temp = [];
        foreach ($Categories as $category) {
            $temp[$category->getId()] = $category;
        }
        $Categories = $temp;
        $page = $paginator->getPaginate();
        $this->view->setVars([
            'categories' => $Categories,
            'page' => $page,
        ]);
    }

    public function addAction()
    {
        $news = new News();
        $form = new NewsForm();
        $this->view->setVars([
            'form' => $form,
            'news' => $news,
        ]);

        $tags = TagsName::find();
        $this->view->setVar('tags', $tags);
        $maxId = News::findFirst([
            'order' => 'id DESC',
            'limit' => 1
        ]);
        $this->view->setVar('maxId', $maxId);

        if (!$this->request->isPost()) {
            return $this->view;
        }
        if ($form->isValid($_POST, $news)) {
            if ($news->create()) {
            }
        }

    }

    public function editAction($slug)
    {
        $news = News::findFirst([
            'conditions' => 'url = :url: ',
            'bind' => [
                'url' => $slug,
            ]]);
        $form = new NewsForm($news);
        $this->view->setVars([
            'form' => $form,
            'news' => $news,
        ]);
        if (!$this->request->isPost()) {
            return $this->view;
        }
        if ($form->isValid($_POST, $news)) {

            if ($news->save()) {
                return $this->response->redirect('/admin');
            }
        }

    }

    public function delAction($slug)
    {
        $news = News::findFirst([
            'conditions' => 'url = :url: ',
            'bind' => [
                'url' => $slug,
            ]]);
        $news->delete();
        $this->response->redirect('/admin');
    }

    public function usersAction()
    {
        $currentPage = (int)$_GET["page"];
        $users = Users::find();
        $paginator = new PaginatorModel(
            [
                "data" => $users,
                "limit" => 10,
                "page" => $currentPage,
            ]
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('page', $page);

    }
    public function addTagAction()
    {

        $tags = new Tags();
        $form = new TagsForm();
        $this->view->setVars([
            'form' => $form,
            'tags' => $tags,
        ]);

        $form->bind($_POST, $tags);
        $tags->create();

    }

}