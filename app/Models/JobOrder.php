<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class JobOrder extends Model
{
    use SoftDeletes;

    protected $table = 'job_order';

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    function joborderdetail() {
        return $this->hasMany(JobOrderDetail::class);
    }
}
