<?php
/*
 * This file is part of the LivingMarkup package.
 *
 * (c) 2017-2021 Ouxsoft  <contact@ouxsoft.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace Ouxsoft\LivingMarkup\Builder;

use Ouxsoft\LivingMarkup\Contract\BuilderInterface;
use Ouxsoft\LivingMarkup\Contract\ConfigurationInterface;
use Ouxsoft\LivingMarkup\Contract\EngineInterface;
use Ouxsoft\LivingMarkup\Engine;

/**
 * Class StaticPageBuilder
 * Builds static pages without any elements being set
 *
 * @package Ouxsoft\LivingMarkup\Page\Builder
 */
class StaticPageBuilder implements BuilderInterface
{
    private $engine;

    public function __construct(EngineInterface &$engine, ConfigurationInterface &$config)
    {
        $this->engine = &$engine;
        $this->config = &$config;
    }

    /**
     * Creates Page object using parameters supplied
     *
     * @return void
     */
    public function createObject(): void
    {
    }

    /**
     * Gets Page object
     *
     * @return Engine
     */
    public function getObject(): Engine
    {
        return $this->engine;
    }
}
