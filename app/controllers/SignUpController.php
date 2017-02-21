<?php

class SignUpController extends ControllerBase
{
    public function indexAction()
    {
        $users = new Users();
        $this->view->setVar('users', $users);

        $form = new UsersForm();
        $this->view->setVar('form', $form);

        if (!$this->request->isPost()) {
            return $this->view;
        }
        $form->bind($_POST, $users);
        if ($form->isValid()) {

            if ($users->create()) {
                return $this->response->redirect('/index');
            }
        }
    }

}