#!/usr/bin/env zx

/// <reference path="node_modules/zx/build/globals.d.ts" />

const result = await $`ls -la`;
console.log(result.json());
