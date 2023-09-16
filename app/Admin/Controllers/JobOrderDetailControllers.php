<?php

namespace App\Admin\Controllers;

use App\Models\JobOrderDetail;
use App\Models\JobOrder;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class JobOrderDetailControllers extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('Job Order Detail'))
            // ->description(trans('admin.description'))
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('admin.detail'))
            ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('admin.edit'))
            ->description(trans('admin.description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new JobOrderDetail);

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->where(function ($query) {
                $query->whereHas('job_order', function ($query) {
                    $query->where('nomor_job_order', 'like', "%{$this->input}%");
                });            
            }, 'Nomor Job Order');
            $filter->where(function ($query) {
                $query->whereHas('jasa', function ($query) {
                    $query->where('nama', 'like', "%{$this->input}%");
                });            
            }, 'Jasa');
            $filter->where(function ($query) {
                $query->whereHas('job_order', function ($query) {
                    $query->whereHas('customer', function ($qc){
                        $qc->where('fullname', 'like', "%{$this->input}%")->orWhere('address', 'like', "%{$this->input}%");
                    });                    
                });            
            }, 'Customer');
            $filter->between('qty', 'QTY');
            $filter->between('price_per_unit', 'Price');
            $filter->between('total_price', 'Total Price');            
            $filter->between('mulai_date_riksa', 'Mulai Riksa')->datetime();
            $filter->between('selesai_date_riksa', 'Selesai Riksa')->datetime();
            $filter->between('mulai_pengecekan', 'Mulai Pengecekan')->datetime();
            $filter->between('selesai_pengecekan', 'Selesai Pengecekan')->datetime();
            $filter->where(function ($query) {
                $query->whereHas('job_order', function ($query) {
                    $query->where('status_pembayaran', "{$this->input}");
                });            
            }, 'Status Pemabayaran')->radio([
                ''   => 'All',
                0    => 'Belum Bayar',
                1    => 'Sudah Bayar',
            ]);
            $filter->like('description', 'Description');
            $filter->between('created_at', 'Created Time')->datetime();
        });

        $grid->disableActions();

        $grid->disableCreateButton();

        $grid->disableRowSelector();

        $grid->disableColumnSelector();

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableView();
            $actions->disableEdit();
            $actions->disableDelete();
        });
        $grid->job_order()->nomor_job_order('Job Order');
        $grid->column('job_order_id', 'Customer & Address')->display(function ($job_order_id) {
            $customer = JobOrder::with('customer')->find($job_order_id);
            return $customer->customer->fullname." (".$customer->customer->address.")";        
        });
        $grid->jasa()->nama('Nama Jasa');
        $grid->qty('QTY.');
        $grid->price_per_unit('Price Per Unit');
        $grid->column('price_per_unit', 'Price Per Unit')->display(function ($price){
            return number_format($price, 2);
        });
        $grid->column('total_price', 'Total Price')->display(function ($tprice){
            return number_format($tprice, 2);
        });
        $grid->mulai_date_riksa('TGL. Mulai Riksa');
        $grid->selesai_date_riksa('TGL. Selesai Riksa');
        $grid->mulai_pengecekan('TGL. Mulai Pengecekan');
        $grid->selesai_pengecekan('TGL. Selesai Pengecekan');
        $grid->job_order()->status_pembayaran('Status Pembayaran')->display(function ($status_pembayaran) {

            // return "<span style='color:blue'>$title</span>";
            if ($status_pembayaran == 1) {
                # code...
                return "Sudah Bayar";
            }else{
                return "Belum Bayar";
            }
        
        });
        $grid->description('Description');
        $grid->created_at(trans('admin.created_at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(JobOrderDetail::findOrFail($id));

        $show->id('ID');
        $show->job_order_id('job_order_id');
        $show->jasa_id('jasa_id');
        $show->qty('qty');
        $show->price_per_unit('price_per_unit');
        $show->total_price('total_price');
        $show->mulai_date_riksa('mulai_date_riksa');
        $show->selesai_date_riksa('selesai_date_riksa');
        $show->mulai_pengecekan('mulai_pengecekan');
        $show->selesai_pengecekan('selesai_pengecekan');
        $show->description('description');
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new JobOrderDetail);

        $form->display('ID');
        $form->text('job_order_id', 'job_order_id');
        $form->text('jasa_id', 'jasa_id');
        // $form->text('qty', 'qty');
        $form->number('qty', 'qty');
        // $form->text('price_per_unit', 'price_per_unit');
        $form->currency('price_per_unit', 'price_per_unit')->symbol('￥');
        // $form->text('total_price', 'total_price');
        $form->currency('total_price', 'total_price')->symbol('￥');
        $form->text('mulai_date_riksa', 'mulai_date_riksa');
        // $form->text('selesai_date_riksa', 'selesai_date_riksa');
        $form->datetime('selesai_date_riksa', 'selesai_date_riksa');
        $form->text('mulai_pengecekan', 'mulai_pengecekan');
        $form->text('selesai_pengecekan', 'selesai_pengecekan');
        $form->text('description', 'description');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
