require(gplots)

visual <- function (){

	# Get external data
	commandArgs();
	counter=0;
	for (input in commandArgs()){
		if(counter==2){
			inputData1=input[1];
		}														
		counter = counter+1;
	}

	x_day  <- c( "day 1", "day 2" , "day 3" , "day 4" );
	x_hour <- c( "1:00", "4:00" , "7:00" , "10:00" , "13:00" , "16:00" , "19:00" , "22:00" );
	


	# DAY EXAMPLE	
	data1  = read.table(inputData1);	
	grid   = data1 [,18];
	pv     = data1 [,8];	
	load   = data1 [,3];

	postscript(paste("plot_day_consumption.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=10.0,height=4.0)	
	par(mar=c(3,5,2,1),xaxs='i',yaxs='i', xpd=TRUE)	
	plot  ( load / 1000 , col="black" , type="l" , xlab='' , ylab='', ylim=c(0,4.0) , xaxt="n" , yaxt="n" , cex.main=2.0 , lwd=0.5 )	
#	lines (   pv   / 1000 , col="blue" , type="l" , lwd=0.5 )
#	lines (   load / 1000 , col="red" , type="l" , lwd=0.5 )

	axis( 1 , at = seq( 60 , 1440, by = 180) , labels=x_hour , las=0 , cex.axis=1.5)
	axis( 2 , las=1 , cex.axis=1.5)

#	mtext(side=1, line=3, expression("Time  (min)") ,  cex=1.5)	
	mtext(side=2, line=3, expression("Power (KW)")  ,  cex=1.5)

#	legend( "top" , inset=c(0.0,-0.15), c( expression("p"[PV]) , expression("p"[L]) , expression("p"[G]) ) , lty=c(1,1,1) , lwd=c(4.0 , 4.0 , 4.0 ) , col=c("blue","red","black") , cex=1.3, bty="n", horiz = TRUE )
	dev.off()



}

visual()
#~






