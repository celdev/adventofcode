import java.util.Arrays;

public class Day5 {

	private static final String INPUT = "0\n3\n0\n1\n-3";

	public static void main(String[] args){
		String[] stepsS = args[0].split(",");
		Step[] steps = new Step[stepsS.length];
		for(int i = 0; i < stepsS.length; i++){
			steps[i] = new Step(stepsS[i]);
		}
		int pc = 0;
		int amountOfSteps = 0;
		for(int i = 0; i < steps.length;){
			//System.out.println(Arrays.toString(steps));
			try{
				int jump = steps[i].step;
				steps[i].incrementStep();
				i += jump;
				amountOfSteps++;
			} catch (ArrayIndexOutOfBoundsException e){
				break;
			}
		}
		System.out.println("Amount of steps needed = " + amountOfSteps);
	}


	private static class Step {
		int step;

		public Step(String s){
			this.step = Integer.valueOf(s);
		}

		public void incrementStep(){
			step++;
		}

		@Override
		public String toString(){
			return "" + step;
		}
	}


}