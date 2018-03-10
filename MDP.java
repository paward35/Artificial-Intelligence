import java.util.Arrays;
import java.util.Scanner;

public class MDP {
	public static void main(String[] args) {
		MDP excerciser = new MDP();
		Scanner input = new Scanner(System.in);
		boolean quit = false;
		System.out.println("This is a program which caluculates a MDP baised on inputs for N, Gamma and state");
		while (!quit) {
			System.out.println("Enter a value for n, or type quit at any time to exit");
			if (input.hasNextInt()) {
				int n = input.nextInt();
				System.out.println("Enter a gamma value.");
				if (input.hasNextDouble()) {
					double g = input.nextDouble();
					System.out.println("Enter a state");
					if (input.hasNext()) {
						String state = input.next();
						System.out.print("The rewards for excerise and relax are: ");
						System.out.println(Arrays.toString(excerciser.rewardCalculator(n, g, state)));
					} else if (input.next().equals("quit")) {
						quit = true;
					} else {
						System.out.println("Invalid input, please start again");
					}
				} else if (input.next().equals("quit")) {
					quit = true;
				} else {
					System.out.println("Invalid input, please start again");
				}
			} else if (input.next().equals("quit")) {
				quit = true;
			} else {
				System.out.println("Invalid input, please enter a valid integer for N or type quit to exit");
			}
		}
		input.close();
		System.exit(0);
	}

	private double p(String state, String action, String endState) {
		if (state.equals("fit") && action.equals("exercise")){
			if (endState.equals("fit")) {
				return .99;
			} else {
				return 0.01;
			}
		} else if (state.equals("fit") && action.equals("relax")) {
			if(endState.equals("fit")) {
				return .7;
			} else {
				return .3;
			}
		} else if (state.equals("unfit") && action.equals("exercise")) {
			if(endState.equals("fit")) {
				return .2;
			} else {
				return .8;
			}
		} else{
			if(endState.equals("fit")) {
				return 0;
			} else {
				return 1;
			}
		}
	}
	
	private int reward(String state, String action) {
		if (state.equals("fit") && action.equals("exercise")){
			return 8;
		} else if (state.equals("fit") && action.equals("relax")) {
			return 10;
		} else if (state.equals("unfit") && action.equals("exercise")) {
			return 0;
		} else{
			return 5;
		}
	}
	
	private double q0(String state, String action) {
		return((p(state,action, "fit")*reward(state,action)) + (p(state,action, "unfit")*reward(state,action)));
	}
	
	private double vn(int n, double G, String state) {
		double exercise = (qn(n, G, state, "exercise"));
		double relax = (qn(n, G, state, "relax"));
		if(exercise > relax) {
			return exercise;
		}
		else {
			return relax;
		}
	}
	
	private double qn(int n, double G, String state, String action) {
		if (n == 0) {
			return q0(state, action);
		} else {
			return(q0(state,action) + (G * ((p(state,action, "fit") * vn(n-1, G, "fit")) + (p(state,action, "unfit") * vn(n-1, G, "unfit")))));
		}
		
		
	}
	
	public double[] rewardCalculator(int n, double G, String state) {
		double[] option = {qn(n, G, state, "exercise"), qn(n, G, state, "relax")};
		return option;
	}
}