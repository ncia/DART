Future<String> helloWorld() {
	return Future.delayed(Duration(seconds: 3), () {
		return "Hello World";
	});
}

Future<String> byeByeWorld() {
	return Future.delayed(Duration(seconds: 3), () {
		return "bye bye World";
	});
}

Future<List<String>> world() async {
	final future1 = await helloWorld();	// await 로 3초간 정지하지만. future1 에는 Future<String> 이 아닌 String이 저장
	final future2 = await byeByeWorld();	// await 로 3초간 정지하지만, future2 에는 Future<String> 이 아닌 String 이 저장

	print('(world) future1: $future1');
	print('(world) future2: $future2');
	print('(world) future1과 future2와 관계 없는 print문, 빨리 수행될 수록 좋음');
	return [future1, future2];
}

void main() {
	final futures = world();	// world() 함수의 return 타입은 Future<List<string>> 이므로
	print('(main) future: $futures');	// futures 의 값은 Instance of 'Future<List<String>>'
}

