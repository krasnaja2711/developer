<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public function initialize()
    {
        if ($this->session->has("authorization")){
            $authorization = $this->session->get('authorization');
            $this->cookies->set('remember-me', $authorization, time()+600);
        }
    }

    public function JsonResponse(array $data)
    {
        $this->view->disable();
        return $this->response->setJsonContent($data);
    }

}
