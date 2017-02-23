<?php

class Comments extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $parent_id;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $comment;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $date;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $news_id;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'comments';
    }


    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getParentId()
    {
        return $this->parent_id;
    }

    /**
     * @param int $parent_id
     */
    public function setParentId($parent_id)
    {
        $this->parent_id = $parent_id;
    }

    /**
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * @param string $comment
     */
    public function setComment($comment)
    {
        $this->comment = $comment;
    }

    /**
     * @return string
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param string $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }

    /**
     * @return int
     */
    public function getNewsId()
    {
        return $this->news_id;
    }

    /**
     * @param int $news_id
     */
    public function setNewsId($news_id)
    {
        $this->news_id = $news_id;
    }

    public function initialize()
    {
        $this->setSchema("developer");
        $this->belongsTo('news_id', '\News', 'id', ['alias' => 'News']);
        $this->hasMany(
            "id",
            "Answers",
            "comment_id"
        );
    }




    public function getAnswers($parameters = null)
    {
        return $this->getRelated("Answers", $parameters);
    }



}
