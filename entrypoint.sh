#!/bin/bash

composer require --dev nunomaduro/larastan
php artisan code:analyse
