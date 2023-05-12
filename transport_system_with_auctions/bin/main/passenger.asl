// Agent passenger in project transport_system_with_auctions

/* Initial beliefs and rules */

request_status("not sent").
assigned(false).

/* Initial goals */

!start_waiting.

/* Plans */

+!start_waiting <- .wait(300);
					.print("is waiting for the start of an requests collection").

+last_notice("The collection of requests has been started."): 
			.my_name(N) & price(P) & start_point(SP) & end_point(EP) & start_time(ST)
			 			 <- .wait(math.random(1000));
			 			 	.send(auctioneer,achieve,add_passenger(N,P,SP,EP,ST));
			  			 	.print("has made a request").

+request_status("accepted") <- .print("participates in the auction").

+request_status("denied") <- .print("waits for the next auction").				   					 
					   					 
+last_notice("Auction has been ended.") <- -assigned(false); +assigned(true).



{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
//{ include("$moiseJar/asl/org-obedient.asl") }
