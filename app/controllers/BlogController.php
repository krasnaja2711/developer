<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class BlogController extends ControllerBase
{

    public function initialize()
    {
        $avrz = $this->session->get("authorization");
        if ($avrz===2) {
            $authorization = $this->session->get('authorization');
            $this->cookies->set('remember-me', $authorization, time()+600);
        }
        else {
            $this->response->redirect('/index');
        }
    }

    public function indexAction()
    {
        $user_id =  $this->session->get("user_id");
        $currentPage = (int) $_GET["page"];
        $Categories = Category::find();
        $News = News::find([
            'conditions' => 'user_id = :user_id:',
            'bind' => [
                'user_id' => $user_id,
            ],
            'order' => 'date DESC'
        ]);

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

        if (!$this->request->isPost()) {
            return $this->view;
        }
        if ($form->isValid($_POST, $news)) {
            if ($news->create()) {
                return $this->response->redirect('/admin');
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


}