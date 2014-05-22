(ert-deftest elpy-disable-should-remove-elpy-from-python-mode ()
  (elpy-testcase ()
    (elpy-enable)
    (should (memq 'elpy-mode python-mode-hook))

    (elpy-disable)

    (should (not (memq 'elpy-mode python-mode-hook)))))

(ert-deftest elpy-disable-should-set-elpy-enable-variable ()
  (elpy-testcase ()
    (elpy-enable)
    (should (eq elpy-enable t))

    (elpy-disable)

    (should (eq elpy-enable nil))))

(ert-deftest elpy-disable-should-global-stop ()
  (elpy-testcase ()
    (mletf* ((global-stop-called nil)
             (elpy-modules-run
              (command &rest args)
              (pcase command
                (`global-stop (setq global-stop-called t)))))
      (elpy-enable)

      (elpy-disable)

      (should global-stop-called))))

;;; AAA so it's run first... argh.
(ert-deftest AAA-elpy-disable-should-work-without-prior-enable ()
  (elpy-testcase ()
    (elpy-disable)))
