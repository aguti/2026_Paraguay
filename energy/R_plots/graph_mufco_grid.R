require(gplots)

visual <- function (){

	commandArgs();

	counter=0;
	for (input in commandArgs()){
		if(counter==2){
			inputData=input[1];
		}				
		counter = counter+1;
	}

	data  = read.table(inputData);	
	power = data [,1];

	x_hour = seq(30*24, 8760, by = 30*24)
	for (i in 1:12 ) {
		x_hour[i] = round( 30*i , 1 );				
	}
	postscript(paste("plot_",inputData,"_year.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=3.0)	
	par(mar=c(5,5,1,1),xaxs='i',yaxs='i')	
	plot ( power / 1000 , col="black" , type="l" , ylim=c(15,40), xlab='' , ylab='',  xaxt="n" , yaxt="n" , lwd=0.5)
	axis( 1 , at = seq(30*24, 8760, by = 30*24) , labels=x_hour , las=0 , cex.axis=1.5 )
	axis( 2 , las=1 , cex.axis=1.5 )
	mtext(side=1, line=3, expression("Time  (day)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (GW)")  ,  cex=1.5)
	dev.off()

	x_days = seq(24, 8760, by = 24)
	for (i in 1:365 ) {
		x_days[i] = round( i , 1 );				
	}
	postscript(paste("plot_",inputData,"_week.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=3.0)	
	par(mar=c(5,5,1,1),xaxs='i',yaxs='i') 
	plot ( power / 1000 , col="black" , type="l" , xlab='' , ylab='', ylim=c(15,40), xlim=c(336,672) , xaxt="n" , yaxt="n" , lwd=0.5)	
	axis( 1 , at = seq(24, 8760, by = 24) , labels=x_days , las=0 , cex.axis=1.5 )
	axis( 2 , las=1 , cex.axis=1.5 )
	mtext(side=1, line=3, expression("Time  (day)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (GW)")  ,  cex=1.5)
	dev.off()

	fft_out <- fft(power, inverse = FALSE)
	
	# WHOLE FFT	
	#x_hour = seq(365, 4380, by = 365)
	#for (i in 1:12 ) {
	#	x_hour[i] = round( 8760 / ( (i) * 365) , 1 );				
	#}	
	#postscript(paste("plot_",inputData,"_fft.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=3.0)	
	#par(mar=c(5,5,1,1),xaxs='i',yaxs='i')	
	#plot ( Mod(fft_out)/(4380 * 0.005) , col="black" , type="l" , xlim=c(0,4380), ylim=c(0,6000) , xaxt="n" , xlab='' , ylab='', cex.axis=1.0 , lwd=0.5)
	#axis(1, at = seq(365, 4380, by = 365), labels=x_hour ,las=2) #labels=c(0,24,12,6,3,1.5,0.75,0.375,0,0,0,0,0)	
	#mtext(side=1, line=3, expression("Period  (hour)") ,  cex=1.5)	
	#mtext(side=2, line=3, expression("Power (MW)")  ,  cex=1.5)	
	#dev.off()

	# SHORT FFT
	week_cmp = 8760 / 168;
	x_hour = seq( week_cmp , 1095 , by = 2*week_cmp)
	for (i in 1:11 ) {
		if ( i != 1 ){
			x_hour[i] = round( 8760 / ( (i-1) * 2*week_cmp + week_cmp) , 1 );
		}		
		else{
			x_hour[i] = round( 8760 / week_cmp , 1 );
		}
	}	
	postscript(paste("plot_",inputData,"_fft.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=3.0)	
	par(mar=c(5,5,1,1),xaxs='i',yaxs='i')	
	plot ( Mod(fft_out)/(4380 * 1000) , col="black" , type="l" , xlim=c(0,1095), ylim=c(0,6) , xaxt="n" , yaxt="n" , xlab='' , ylab='', lwd=0.5)
	axis(1, at = seq(week_cmp , 1095 , by = 2*week_cmp), labels=x_hour , las=0, cex.axis=1.5)	
	axis( 2 , las=1 , cex.axis=1.5 )
	mtext(side=1, line=3, expression("Period  (hour)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (MW)")  ,  cex=1.5)	
	dev.off()

	postscript(paste("plot_",inputData,"_fft_small.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=6.0,height=5.0)	
	par(mar=c(5,5,1,1),xaxs='i',yaxs='i')	
	plot ( Mod(fft_out)/(4380 * 1000) , col="black" , type="l" , xlim=c(0,1095), ylim=c(0,5) , xaxt="n" , yaxt="n" , xlab='' , ylab='', lwd=0.5)
	axis(1, at = seq(week_cmp , 1095 , by = 2*week_cmp), labels=x_hour , las=0, cex.axis=1.5)	
	axis( 2 , las=1 , cex.axis=1.5 )
	mtext(side=1, line=3, expression("Period  (hour)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (MW)")  ,  cex=1.5)	
	dev.off()

	#########################################################################################
	# CONSTANT
	x_days = seq(24, 8760, by = 24)
	for (i in 1:365 ) {
		x_days[i] = round( i , 1 );				
	}
	power <- rep(28000, 8760)
	postscript(paste("plot_constant_week.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=3.0)	
	par(mar=c(5,5,1,1),xaxs='i',yaxs='i') 
	plot ( power / 1000 , col="black" , type="l" , xlab='' , ylab='', ylim=c(15,40), xlim=c(336,672) , xaxt="n" , yaxt="n" , lwd=0.5)	
	axis( 1 , at = seq(24, 8760, by = 24) , labels=x_days , las=0 , cex.axis=1.5 )
	axis( 2 , las=1 , cex.axis=1.5 )
	mtext(side=1, line=3, expression("Time  (day)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (GW)")  ,  cex=1.5)
	dev.off()

	# SHORT FFT
	fft_out <- fft(power, inverse = FALSE)

	week_cmp = 8760 / 168;
	x_hour = seq( week_cmp , 1095 , by = 2*week_cmp)
	for (i in 1:11 ) {
		if ( i != 1 ){
			x_hour[i] = round( 8760 / ( (i-1) * 2*week_cmp + week_cmp) , 1 );
		}		
		else{
			x_hour[i] = round( 8760 / week_cmp , 1 );
		}
	}	
	postscript(paste("plot_constant_fft.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=3.0)	
	par(mar=c(5,5,1,1),xaxs='i',yaxs='i')	
	plot ( Mod(fft_out)/(4380 * 1000) , col="black" , type="l" , xlim=c(0,1095), ylim=c(0,6) , xaxt="n" , yaxt="n" , xlab='' , ylab='', lwd=0.5)
	axis(1, at = seq(week_cmp , 1095 , by = 2*week_cmp), labels=x_hour , las=0, cex.axis=1.5)	
	axis( 2 , las=1 , cex.axis=1.5 )
	mtext(side=1, line=3, expression("Period  (hour)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (MW)")  ,  cex=1.5)	
	dev.off()

}


visual()
#~
