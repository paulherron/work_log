Work Log
========

A script to help with logging work tasks and the time spent on them.

Installation
------------

	git clone https://github.com/paulherron/work_log.git
	cd work_log
	./work_log

That will parse the example log that's included in the repo, `example_log.txt`.

You could also move or symlink the `work_log` and `work_log.awk` files into a location you prefer, e.g. your `~/bin` directory if you have one. As long as the path to that directory is exported you should be able to use the script from anywhere.


Usage
-----

Keep a log in this format and save it within your project with a filename like `myproject_log.txt`:

	---------- 2014-05-16 --------------------------|

	Fix database crash when searching with special characters. [30]
	Add new navigation to website header. [70]
	Do offsite backups. [20]


	---------- 2014-05-17 --------------------------|

	Do mockup of new contact page. [120]


	-- end --

	put to-do items or other notes here - nothing beyond the line above will get processed

Dates are in the headings, each task has a line and on the end of the line you can put the number of minutes it took.

You can put anything you like after the `-- end --` line and it won't be processed. I tend to put my to-do list there and move items up into the list of completed tasks once they're done.

When you run the script it'll parse the log file and output a summary of times spent:


	---------- 2014-05-16 --------------------------|

	Fix database crash when searching with special characters. [30]
	 +  30
	Add new navigation to website header. [70]
	 +  70
	Do offsite backups. [20]
	 +  20

	Total for this day is 120  minutes (2 hours)


	---------- 2014-05-17 --------------------------|

	Do mockup of new contact page. [120]
	 +  120

	Total for this day is 120  minutes (2 hours)


	-- end --

	Grand total is 240  minutes (4 hours)

You'd run the script by doing something like:

	work_log ~/Path/to/myproject_log.txt

Or if your work log is within the current directory (or its parent directory) you can just do:

	work_log
