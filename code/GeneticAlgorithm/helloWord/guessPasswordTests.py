#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar  7 16:47:47 2019

@author: czh
"""

import datetime
import unittest
import random
from genetic import *


def get_fitness(guess, target):
    return sum(1 for expected, actual in zip(target, guess)
               if expected == actual)


def display(candidate, startTime):
    timeDiff = datetime.datetime.now() - startTime
    print("{0}\t{1}\t{2}".format(
        candidate.Genes, candidate.Fitness, str(timeDiff)))


class GuessPasswordTests(unittest.TestCase):
    geneset = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!.,"

    def test_Hello_World(self):
        target = "Hello World!"
        self.guess_password(target)

    def test_For_I_am_fearfully_and_wonderfully_made(self):
        target = "For I am fearfully and wonderfully made."
        self.guess_password(target)

    def guess_password(self, target):
        startTime = datetime.datetime.now()

        def fnGetFitness(genes):
            return get_fitness(genes, target)

        def fnDisplay(candidate):
            display(candidate, startTime)

        optimalFitness = len(target)
        best = get_best(fnGetFitness, len(target),
                                optimalFitness, self.geneset, fnDisplay)
        self.assertEqual(best.Genes, target)

    def test_Random(self):
        length = 150
        target = ''.join(random.choice(self.geneset) for _ in
                         range(length))

        self.guess_password(target)

    def test_benchmark(self):
        Benchmark.run(lambda: self.test_Random())

GuessPasswordTests().test_Hello_World()