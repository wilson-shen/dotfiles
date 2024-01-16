<?php

use PhpCsFixer\Config;
use PhpCsFixer\Finder;

$rules = [
    '@PSR12' => true,
    '@Symfony' => true,
    'array_indentation' => true,
    'braces_position' => [
        'anonymous_classes_opening_brace' => 'next_line_unless_newline_at_signature_end',
    ],
    'full_opening_tag' => true,
    'global_namespace_import' => [
        'import_classes' => true,
        'import_constants' => null,
        'import_functions' => null,
    ],
    'increment_style' => false,
    'lambda_not_used_import' => false,
    'method_chaining_indentation' => true,
    'multiline_whitespace_before_semicolons' => [
        'strategy' => 'no_multi_line',
    ],
    'new_with_parentheses' => [
        'anonymous_class' => false,
    ],
    'no_superfluous_phpdoc_tags' => false,
    'no_unneeded_control_parentheses' => false,
    'not_operator_with_successor_space' => false,
    'phpdoc_separation' => false,
    'phpdoc_align' => [
      'align' => 'left',
    ],
    'php_unit_method_casing' => [
        'case' => 'snake_case',
    ],
    'protected_to_private' => false,
    'psr_autoloading' => true,
    'single_trait_insert_per_statement' => false,
    'visibility_required' => [
        'elements' => [
            'method',
            'property',
        ],
    ],
    'yoda_style' => false,
];

$finder = Finder::create()
    ->name('*.php')
    ->notName('*.blade.php')
    ->ignoreDotFiles(true)
    ->ignoreVCS(true);

$config = new Config();

return $config->setFinder($finder)
    ->setRules($rules)
    ->setRiskyAllowed(true)
    ->setUsingCache(true);
