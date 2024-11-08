abstract class UseCase<Type, Params>{
  external Future<Type> call({Params params});
}