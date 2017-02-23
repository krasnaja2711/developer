<?php


class TagsController extends ControllerBase
{
    public function indexAction()
    {
        $tag_id = $this->dispatcher->getParam('tag_id');
        $news_id = $this->modelsManager->createBuilder()
            ->from("Tags")
            ->columns('news_id')
            ->where("tag_id = :tag_id:", ["tag_id" => $tag_id])
            ->getQuery()
            ->execute();
        $news = [];
                for ($i = 0; $i<count($news_id); $i++){
                    foreach ($news_id[$i] as $key => $value) {
                    $one_news = News::findFirst([
                        'conditions' => 'id = :news_id:',
                        'bind'=>[
                            'news_id' => $value,
                        ]
                   ]);
                    array_push($news, $one_news);
                }
            }
        $this->view->setVar('news', $news);


    }
}