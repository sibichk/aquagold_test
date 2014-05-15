<?php
class ControllerAccountReward extends Controller {
	private $error = array();
	
	public function index() {
		if (!$this->customer->isLogged()) {
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['code'])) {
				$this->session->data['code'] = $this->request->post['code'];
			}
			$this->session->data['redirect'] = $this->url->link('account/reward', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/reward');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('checkout/voucher');

		if ((($this->request->server['REQUEST_METHOD'] == 'POST') || isset($this->session->data['code'])) && $this->validate()) {
			if(isset($this->session->data['code'])) {
				$code = $this->session->data['code'];
				unset($this->session->data['code']);
			} else {
				$code = $this->request->post['code'];
			}
			
			$voucher = $this->model_checkout_voucher->getVoucher($code);
			
			if($this->customer->getCustomerType() == 2) {
				$this->model_checkout_voucher->redeem($voucher['voucher_id'], $voucher['order_id'], $voucher['amount']);
				$this->model_checkout_voucher->reward($code, $voucher['order_id'], 'Gift card', $voucher['amount']/10);
				$status = 'redeemed';
			} else {
				$credit = $voucher['amount'] - $voucher['amount']*5/100;
				$this->model_checkout_voucher->transaction($voucher['order_id'], 'Gift card', $credit);
				$this->model_checkout_voucher->reward($code, $voucher['order_id'], 'Gift card', $voucher['amount']/10);
				$status = 'activated';
			}

			$subject = "Your gift card has been $status!";

			$message  = "You have successfully $status your giftcard." . "\n\n";
			if($this->customer->getCustomerType() == 2) {
				$message .= 'Activation code:' . "\n\n";
				$message .= $code;
			}

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->customer->getEmail());
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();

			$this->session->data['success'] = "Your gift card has been $status!";

			$this->redirect($this->url->link('account/reward', '', 'SSL'));
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_reward'),
			'href'      => $this->url->link('account/reward', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->load->model('account/reward');
		$this->load->model('account/order');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_description'] = $this->language->get('column_description');
		$this->data['column_points'] = $this->language->get('column_points');

		$this->data['text_total'] = $this->language->get('text_total');
		$this->data['text_empty'] = $this->language->get('text_empty');

		$this->data['button_continue'] = $this->language->get('button_continue');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}		

		$this->data['rewards'] = array();

		$data = array(				  
			'sort'  => 'date_added',
			'order' => 'DESC',
			'start' => ($page - 1) * 10,
			'limit' => 10
		);

		$reward_total = $this->model_account_reward->getTotalRewards($data);

		$results = $this->model_account_reward->getRewards($data);

		foreach ($results as $result) {
			$this->data['rewards'][] = array(
				'order_id'    => $result['order_id'],
				'points'      => $result['points'],
				'description' => $result['description'],
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'href'        => $this->url->link('account/order/info', 'order_id=' . $result['order_id'], 'SSL')
			);
		}	

		$pagination = new Pagination();
		$pagination->total = $reward_total;
		$pagination->page = $page;
		$pagination->limit = 10; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('account/reward', 'page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['total'] = (int)$this->customer->getRewardPoints();
		$this->data['credit'] = $this->currency->format($this->customer->getBalance());
		$this->data['orders'] = $this->model_account_order->getTotalOrders();
		$this->data['vouchers'] = $this->model_account_order->getTotalVouchers();

		$this->data['continue'] = $this->url->link('account/account', '', 'SSL');
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['reward'] = $this->url->link('account/reward', '', 'SSL');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['product'] = $this->url->link('product/product', 'product_id=50');
		$this->data['heartofgold'] = $this->url->link('information/information', 'information_id=7');
		$this->data['goldrush'] = $this->url->link('information/information', 'information_id=8');
		$this->data['referralPatient'] = $this->url->link('information/information', 'information_id=10');
		$this->data['referralPhysician'] = $this->url->link('information/information', 'information_id=11');
		$this->data['resources'] = $this->url->link('information/information', 'information_id=14');
		$this->data['type'] = $this->customer->getCustomerType();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/reward.tpl')) {
			if($this->data['type'] == 1)
			$this->template = $this->config->get('config_template') . '/template/account/reward_physician.tpl';
			else if($this->data['type'] == 2)
			$this->template = $this->config->get('config_template') . '/template/account/reward_patient.tpl';
			else
			$this->template = $this->config->get('config_template') . '/template/account/reward.tpl';
		} else {
			$this->template = 'default/template/account/reward.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);

		$this->response->setOutput($this->render());		
	}
	
	protected function validate() {
		if(isset($this->session->data['code'])) {
			$code = $this->session->data['code'];
		} else {
			$code = $this->request->post['code'];
		}
		
		$voucher = $this->model_checkout_voucher->getVoucher($code);
		
		if (!isset($code)) {
			$this->error['warning'] = 'Please enter code';
		} elseif (!$voucher) {
			$this->error['warning'] = 'Please enter valid code';
		} elseif ($this->model_checkout_voucher->getTotalRewards($code) > 0) {
			$this->error['warning'] = 'Please enter new code';
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	} 		
}
?>