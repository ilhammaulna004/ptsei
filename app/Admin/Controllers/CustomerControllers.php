<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class CustomerControllers extends Controller
{
    use HasResourceActions;

    // API
    public function fetch(Request $request){
        $q = "";
        if ($request->q) {
            # code...
            $q = $request->q;
        }
        // return Customer::where("fullname", "LIKE", "%".$q."%")->orWhere("address", "LIKE", "%".$q."%")->paginate();
        return Customer::where("fullname", "LIKE", "%".$q."%")->orWhere("address", "LIKE", "%".$q."%")->paginate(null, ['id', 'fullname as text']);
    }
    // END API

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('Customer'))
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
        $grid = new Grid(new Customer);

        $grid->id('ID');
        $grid->fullname('fullname');
        $grid->pic('pic');
        $grid->nohp('nohp');
        $grid->address('address');
        $grid->npwp('npwp');
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

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
        $show = new Show(Customer::findOrFail($id));

        // $show->id('ID');
        $show->fullname('fullname');
        $show->pic('pic');
        $show->nohp('nohp');
        $show->address('address');
        $show->npwp('npwp');
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
        $form = new Form(new Customer);

        // $form->display('ID');
        $form->text('fullname', 'Fullname')->rules('required|min:3');
        $form->text('pic', 'PIC')->rules('required|min:3');
        $form->text('nohp', 'NO. HP.')->rules('required|numeric|min:3');
        $form->textarea('address', 'Address')->rows(10);
        $form->text('npwp', 'NPWP.');
        // $form->display(trans('admin.created_at'));
        // $form->display(trans('admin.updated_at'));

        return $form;
    }
}
