#!/bin/bash

omd create --reuse mon
omd --force init mon
omd stop mon
omd disable mon
omd config mon set DEFAULT_GUI check_mk 
omd config mon set TMPFS off 
omd config mon set CRONTAB on 
omd config mon set APACHE_MODE own 
omd config mon set APACHE_TCP_ADDR 0.0.0.0 
omd config mon set APACHE_TCP_PORT 5000 
omd config mon set THRUK_COOKIE_AUTH off
omd config mon set CORE nagios
omd enable mon

