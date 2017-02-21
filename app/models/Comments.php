<?php

class Comments extends \Phalcon\Mvc\Model
{
    /**
     * @return int
     */
    public function getParentId()
    {
        return $this->parent_id;
    }

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
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * @return string
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @return int
     */
    public function getNewsId()
    {
        return $this->news_id;
    }

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

    public function initialize()
    {
        $this->setSchema("cats");
        $this->belongsTo('news_id', '\News', 'id', ['alias' => 'News']);
        $this->hasMany(
            "id",
            "Answers",
            "comment_id"
        );
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'comments';
    }


    public function getAnswers($parameters = null)
    {
        return $this->getRelated("Answers", $parameters);
    }

}
