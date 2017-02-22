<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
class NewsController extends ControllerBase
{
    public function detailAction()
    {
        $form1 = new CommentsForm();
        $comments = new Comments();
        $this->view->setVars([
            'form1' => $form1,
            'comments' => $comments,
        ]);

        $slug = $this->dispatcher->getParam('slug');
        $category = $this->dispatcher->getParam('category');

        if ($this->request->isPost()) {
            if ($form1->isValid($_POST, $comments)) {
                if ($comments->create()) {
                    return $this->JsonResponse([0]);
                }
            } else{
                return $this->JsonResponse([2]);
            }
        }

        $news = News::findFirst([
            'conditions' => 'url = :url: and cat_id = :cat_id:',
            'bind' => [
                'url' => $slug,
                'cat_id' => $category['id']
            ]]);

        if ($news === false) {
            $this->dispatcher->forward(
                [
                    'controller' => 'error',
                    'action' => 'show404'
                ]
            );
        }
        $this->view->setVar('news', $news);

        $news_id = $news->getId();
        $Comments = Comments::find([
            'conditions' => 'news_id = :news_id: and parent_id = :parent_id: ',
            'bind' => [
                'news_id' => $news_id,
                'parent_id' => 0,
            ]
       ]);
        $this->view->setVar('Comments', $Comments);

        $temp = [];
        $allComments = Comments::find();
        foreach ($allComments   as $comment) {
            if ($comment->getParentId()!= 0){
                $temp[$comment->getId()] = $comment;
            }
        }
        $this->view->setVar('comments', $temp);
        $likes = Like::find([
            'conditions' => 'news_id = :news_id:',
            'bind' => [
                'news_id' => $news_id,
            ]
        ]);
        $rating = count($likes);
        $user_id = $this->session->get('user_id');
        $like = Like::findFirst([
            'conditions' => 'user_id = :user_id: and news_id = :news_id:',
            'bind'=>[
                'user_id' => $user_id,
                'news_id' => $news_id,
            ]
        ]);
        $this-> view-> setVar('rating', $rating);
        $this-> view-> setVar('like', $like);
    }


    public function delAction($id)
    {
        $comment = Comments::findFirst([
            'conditions' => 'id = :id: ',
            'bind' => [
                'id' => $id,
            ]]);
        $comment->delete();
        $url = $this->request->getPost("current_url");
        $this->response->redirect($url);
    }


    public function searchAction(){

        $currentPage = (int) $_GET["page"];
        $Categories = Category::find();
        $news = News::find([
            'conditions' => 'title like :title: or text like :title: ',
            'bind' => [
                'title' => '%' . $_POST['search'] .'%',
            ]]);
        $paginator = new PaginatorModel(
            [
                "data"  => $news,
                "limit" => 3,
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

    public function likeAction(){
        $news_id = $this->request->getPost("news_id");
        $like = new Like();
        $form = new LikeForm();
        $this->view->setVars([
            'form' => $form,
            'like' => $like,
        ]);
        if ($form->isValid($_POST, $like)) {
            if ($like->create()) {
                $likes = Like::find([
                    'conditions' => 'news_id = :news_id:',
                    'bind' => [
                        'news_id' => $news_id,
                    ]
                ]);
                $rating = count($likes);
                return $this->JsonResponse([$rating]);
            }
        }
    }

    public function disLikeAction(){
        $user_id = $this->request->getPost("user_id");
        $news_id = $this->request->getPost("news_id");
        $like = Like::findFirst([
            'conditions' => 'user_id = :user_id: and news_id = :news_id:',//доп условия
            'bind' => [
                'user_id' => $user_id,
                'news_id' => $news_id,

            ]]);
        if($like->delete()){
            $likes = Like::find([
                'conditions' => 'news_id = :news_id:',
                'bind' => [
                    'news_id' => $news_id,
                ]
            ]);
            $rating = count($likes);
            return $this->JsonResponse([$rating]);
        }


    }


}