public aspect TraceAspectBixler {
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
   pointcut methodToTrace():  classToTrace() &&  execution(String getName());

   before(): methodToTrace() {
	   String info = "[BGN] " + thisJoinPointStaticPart.getSignature() + ", " + thisJoinPointStaticPart.getSourceLocation().getLine();
	   System.out.println(info);
   }

   after(): methodToTrace() {
	   String info = "[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName();
      System.out.println(info);
   }
}
