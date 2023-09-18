<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class JobOrder extends Model
{
    use SoftDeletes;

    protected $table = 'job_order';

    protected $appends = ['lihat_jasa_for_grid', 'lihat_invoice_for_grid'];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    function joborderdetail() {
        return $this->hasMany(JobOrderDetail::class);
    }

    function invoice() {
        return $this->hasMany(Invoice::class);
    }

    public function getLihatJasaForGridAttribute()
    {
        return '';  
    }

    public function getLihatInvoiceForGridAttribute()
    {
        return '';  
    }
}
