<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class IndexController extends ControllerBase
{
    public function indexAction()
    {
        $currentPage = (int)$_GET["page"];
        $News = News::find(["order" => "date DESC"]);
        $News = $this->modelsManager->createBuilder()
            ->from("News")
            ->columns('*')
            ->orderBy('date DESC')
            ->where("tag_id = :tag_id:", ["tag_id" => $tag_id])
            ->getQuery()
            ->execute();

        $paginator = new PaginatorModel(
            [
                "data" => $News,
                "limit" => 4,
                "page" => $currentPage,
            ]
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('page', $page);
        $form = new LoginForm();
        $users = new Users();
        $this->view->setVars([
            'form' => $form,
            'users' => $users,
        ]);
        $rating =  $likes = Like::find([
            'conditions' => 'news_id = :news_id:',
            'bind' => [
                'news_id' => $news_id,
            ]
        ]);
        $rating = count($likes);
        if (!$this->request->isPost()) {
            return $this->view;
        }
        $form->bind($_POST, $users);
        if (($_POST['login'])=="" || $_POST['pass'] =="" ){
            return $this->JsonResponse([2]);
        }
        if ($form->isValid()) {
            $login = $this->request->getPost("login");
            $pass = $this->request->getPost("pass");
            $user = Users::findFirst([
                'conditions' => 'login = :login: and pass = :pass: and id_roles = 1',
                'bind' => [
                    'login' => $login,
                    'pass' => $pass,
                ]]);
            if ($user) {
                $user_id = $user->getId();
                $authorization = 1;
                $this->session->set("authorization", $authorization);
                $this->session->set("login", $login);
                $this->session->set("user_id", $user_id);
                return $this->JsonResponse([3]);
            }

            $user = Users::findFirst([
                'conditions' => 'login = :login: and pass = :pass: and id_roles = 2',
                'bind' => [
                    'login' => $login,
                    'pass' => $pass,
                ]]);

            if ($user) {
                $authorization = 2;
                $user_id = $user->getId();
                $this->session->set("authorization", $authorization);
                $this->session->set("login", $login);
                $this->session->set("user_id", $user_id);
                return $this->JsonResponse([3]);
            } else{
                return $this->JsonResponse([1]);
            }

        }else{
            return $this->JsonResponse([0]);
        }

    }

}