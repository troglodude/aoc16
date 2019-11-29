;;;; aoc16.asd

(asdf:defsystem #:aoc16
  :description "Advent of Code 2016"
  :depends-on ("cl-ppcre" "arrows" "md5" "bit-smasher" "map-set" "alexandria" "anaphora")
  :serial t
  :components ((:file "package")
               (:file "day01")
               (:file "day02")
               (:file "day03")
               (:file "day04")
               (:file "day05")
               (:file "day06")
               (:file "day07")
               (:file "day08")
               (:file "day09")
               (:file "day10")
               (:file "day11")
               (:file "day12")
               (:file "day13")
               (:file "day14")
               (:file "day15")
               (:file "day16")
               ;; (:file "day17")
               ;; (:file "day18")
               ;; (:file "day19")
               ;; (:file "day20")
               ;; (:file "day21")
               ;; (:file "day22")
               ;; (:file "day23")
               ;; (:file "day24")
               ;; (:file "day25")
               (:file "aoc16")))
