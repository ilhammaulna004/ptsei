<?php

Namespace App\Admin\Extensions;

Use Encore\Admin\Grid\Exporters\ExcelExporter;

class JobOrderExporter extends ExcelExporter
{
    protected $fileName = 'Article list.xlsx';
    protected $headings = ['ID', 'Nomor Job Order', 'Customer', 'Price' ,'Mulai Riksa', 'Selesai Riksa', 'Nomor PO', 'Tanggal Pembayaran', 'Status Pembayaran', 'Project By', 'Nama Pengawas', 'No. Hp Pengawas', 'Description', 'Data Dibuat' ];

    /* protected $columns = [
        'id' => 'ID',
        'nomor_job_order' => 'No. Job Order',
    ]; */
    /* public function map($invoice): array
    {
        // This example will return 3 rows.
        // First row will have 2 column, the next 2 will have 1 column
        return [
            [
                $invoice->invoice_number,
                Date::dateTimeToExcel($invoice->created_at),
            ],
            [
                $invoice->lines->first()->description,
            ],
            [
                $invoice->lines->last()->description,
            ]
        ];
    } */
}