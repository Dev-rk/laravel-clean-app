<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class TimeTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testExample()
    {
        $response = $this->get('/test');

        $response->assertStatus(200);
        $response->assertJsonStructure([
            'timestamp',
            'date',
            'time',
            'timezone' => [
                'timezone_type',
                'timezone'
            ]
        ]);
    }
}
