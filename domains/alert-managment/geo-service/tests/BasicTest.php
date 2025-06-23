<?php
use PHPUnit\Framework\TestCase;
class BasicTest extends TestCase {
  public function testAdd() {
    $this->assertEquals(2, 1 + 1);
  }
}