require(gplots)

visual <- function (){

	commandArgs();

	counter=0;
	for (input in commandArgs()){
		if(counter==2){
			inputData1=input[1];
		}
		if(counter==3){
			inputData2=input[1];
		}	
		counter = counter+1;
	}

	# LOADS
	
	data1 = read.table(inputData1);	
	data2 = read.table(inputData2);	

	power1 = data1 [,1];
	power2 = data2 [,1];

	power1 = spline( power1 , n=5*length(power1) );
	power2 = spline( power2 , n=5*length(power2) );
	
	x_hour <- c( "00:00", "6:00" , "12:00" , "18:00" , "00:00" );

	postscript(paste("plot_PV_forecast.eps",sep=""),onefile = FALSE, horizontal = FALSE,paper = "special",width=6.0,height=5.0)	
	par(mar=c(5,5,4,2),xaxs='i',yaxs='i', xpd=FALSE)
	plot ( power1 , col="black" , lty=1 ,lwd=1.0 , type="l" , xlim=c(7920,7944), ylim=c(0,5000) , xlab='' , ylab='',  xaxt="n" , yaxt="n" )	
	lines( power2 , col="black" , lty=2 ,lwd=1.0 );
	axis( 1 , at = seq(7920 , 7944, by = 6) , labels=x_hour , las=0 , cex.axis=1.5)
	axis( 2 , at = seq(0,5000, by = 1000) , labels= seq(0,5, by = 1)      , las=1 , cex.axis=1.5)
	mtext(side=2, line=3, expression("Power (kW)")  , cex=1.5)
	mtext(side=1, line=3, expression("Time (hour)") , cex=1.5)
	par(xpd=TRUE)	
	legend( "topleft" , inset=c( -0.15 , -0.26 ), c( expression("Real") , expression("Forecast") ) , lty=c( 1 , 2 ) , lwd=c( 5.0 , 5.0 ) , cex=2.0, bty="n", ncol=2 , seg.len=3.0)	
	dev.off()

}


visual()
#~













