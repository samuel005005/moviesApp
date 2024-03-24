abstract class UseCaseWithArguments<Type, Arguments> {
  Future<Type> execute(Arguments arguments);
}
