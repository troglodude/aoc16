(in-package :day09)

(defun read-input (inpath)
  (with-open-file (s inpath)
    (with-output-to-string (v)
      (princ (read-line s nil nil) v))))

(defun parse-numbers (str beg x end)
  (values (parse-integer (subseq str (1+ beg) x))
          (parse-integer (subseq str (1+ x) end))))

(defun amount-times-end (str pos-op)
  (let* ((pos-x (position #\x str :start pos-op))
         (pos-cp (position #\) str :start pos-x))
         (amount (parse-integer (subseq str (1+ pos-op) pos-x)))
         (times (parse-integer (subseq str (1+ pos-x) pos-cp))))
    (values amount times pos-cp)))

;; alternative (does not use cl-ppcre, but still no recursion)
(defun count-decompressed (str)
  (let ((declen 0)
        (tmp (copy-seq str)))
    (loop do
         (let ((pos-open-paren (position #\( tmp)))
           (cond ((null pos-open-paren)
                  (incf declen (length tmp))
                  (return-from count-decompressed declen))
                 (t (multiple-value-bind (amount times pos-close-paren)
                        (amount-times-end tmp pos-open-paren)
                      (incf declen (+ pos-open-paren (* amount times)))
                      (setf tmp (subseq tmp (+ pos-close-paren amount 1))))))))))

(defun sol1 ()
  (-<> (read-input "./inputs/day09")
       (count-decompressed <>)))

(defun count-decompressed-2 (str)
  (let ((pos-op (position #\( str)))
    (cond ((null pos-op)
           (return-from count-decompressed-2 (length str)))
          (t (multiple-value-bind (amount times pos-cp)
                 (amount-times-end str pos-op)
               (let* ((nstart (1+ pos-cp))
                      (nend (+ nstart amount))
                      (sub (count-decompressed-2 (subseq str nstart nend))))
                 (+ pos-op (* times sub) (count-decompressed-2 (subseq str nend)))))))))

(defun sol2 ()
  (-<> (read-input "./inputs/day09")
       (count-decompressed-2 <>)))
