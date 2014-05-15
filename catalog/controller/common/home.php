<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		$this->data['search'] = $this->url->link('account/search', '', 'SSL');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['reward'] = $this->url->link('account/reward', '', 'SSL');
		$this->data['product'] = $this->url->link('product/product', 'product_id=50');
		$this->data['heartofgold'] = $this->url->link('information/information', 'information_id=7');
		$this->data['goldrush'] = $this->url->link('information/information', 'information_id=8');
		$this->data['faq'] = $this->url->link('information/information', 'information_id=9');
		$this->data['resources'] = $this->url->link('information/information', 'information_id=14');
		
		$this->data['type'] = $this->customer->getCustomerType();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			if($this->data['type'] == 1)
			$this->template = $this->config->get('config_template') . '/template/common/home_physician.tpl';
			else if($this->data['type'] == 2)
			$this->template = $this->config->get('config_template') . '/template/common/home_patient.tpl';
			else
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
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
}
?>