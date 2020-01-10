<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class TestController
 *
 * @package App\Http\Controllers
 */
class TestController extends Controller
{
    /**
     * @return JsonResponse
     */
    public function sayHello()
    {
        $timeObject = now();

        return new JsonResponse([
            'timestamp' => $timeObject->getTimestamp(),
            'date' => $timeObject->format('Y-m-d'),
            'time' => $timeObject->format('H:i:s'),
            'timezone' => $timeObject->getTimezone(),
        ]);
    }
}
