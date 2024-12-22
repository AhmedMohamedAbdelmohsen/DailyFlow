import 'package:daily_flow/app/di.dart';
import 'package:daily_flow/app/functions.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';
import 'package:daily_flow/presentation/login/manager/login_cubit/login_cubit.dart';
import 'package:daily_flow/presentation/resources/assets_manager.dart';
import 'package:daily_flow/presentation/resources/color_manager.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';
import 'package:daily_flow/presentation/resources/routes_manager.dart';
import 'package:daily_flow/presentation/resources/styles_manager.dart';
import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:daily_flow/presentation/widgets/custom_loading.dart';
import 'package:daily_flow/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginCubit loginCubit = instance<LoginCubit>();

  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool isLoading = false;
  String? emailErrorMsg;
  String? passwordErrorMsg;
  bool isAllValid = false;
  Key loginCubitKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        key: loginCubitKey, // Unique key to reinitialize the LoginCubit
        create: (BuildContext context) => loginCubit,
        child: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p03.dp),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // shrinkWrap: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomAuthFormFiled(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            cursorColor: ColorManager.darkGreyBlue,
                            autofillHints: const [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            hintText: LocaleKeys.enterEmail.tr(),
                            labelText: LocaleKeys.userEmail.tr(),
                            onChanged: loginCubit.updateEmail,
                            errorText: emailErrorMsg,
                            textDirection: isRTL(context)
                                ? ui.TextDirection.rtl
                                : ui.TextDirection.ltr,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp('[a-zA-Z ]')),
                            // ],
                          ),
                          SizedBox(height: AppSize.s2.h),
                          CustomAuthFormFiled(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            cursorColor: ColorManager.darkGreyBlue,
                            autofillHints: const [AutofillHints.password],
                            obscureText: showPassword,
                            textInputAction: TextInputAction.done,
                            hintText: LocaleKeys.enterPassword.tr(),
                            labelText: LocaleKeys.password.tr(),
                            onChanged: loginCubit.updatePassword,
                            errorText: passwordErrorMsg,
                            textDirection: isRTL(context)
                                ? ui.TextDirection.rtl
                                : ui.TextDirection.ltr,
                            suffixIcon: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: IconTheme(
                                  data: IconThemeData(
                                      color: ColorManager.coolGrey),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: AppPadding.p8),
                                    child: Transform.scale(
                                      scale: AppSize.s05,
                                      child: showPassword
                                          ? SvgPicture.asset(
                                              IconAssets.eyeOff,
                                              height: AppSize.s14,
                                              color: ColorManager.darkGreyBlue,
                                            )
                                          : SvgPicture.asset(
                                              IconAssets.eye,
                                              height: AppSize.s14,
                                              color: ColorManager.darkGreyBlue,
                                            ),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: AppSize.s2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  activeColor: Colors.blue,
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                      horizontal: -AppSize.s4,
                                      vertical: AppSize.s0),
                                  title: Text(
                                    LocaleKeys.rememberMe.tr(),
                                    style: getRegularLexendStyle(
                                      color: ColorManager.greyishBrownTwo,
                                      fontSize: AppSize.s15.sp,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (bool? value) {},
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  LocaleKeys.forgotPassword.tr(),
                                  style: getSemiBoldLexendStyle(
                                    color: ColorManager.waterBlue,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.s6.h),
                          isLoading
                              ? LoadingWidget(
                                  size: AppSize.s35,
                                  color: ColorManager.waterBlue)
                              : SizedBox(
                                  height: AppSize.s7.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: isAllValid
                                        ? () {
                                            loginCubit.login(LoginRequest(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text));
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(AppSize
                                            .s30), // Set the desired radius here
                                      ),
                                    ),
                                    child: Text(
                                      LocaleKeys.singIn.tr(),
                                      style: getSemiBoldLexendStyle(
                                        color: ColorManager.whiteTwo,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(height: AppSize.s10.h),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "${DateTime.now().year} ${LocaleKeys.copyRight.tr()} ${LocaleKeys.allRight.tr()}",
                              textAlign: TextAlign.center,
                              style: getRegularLexendStyle(
                                  color: ColorManager.greyIshBrown,
                                  fontSize: AppSize.s13.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (BuildContext context, LoginState state) {
            if (state is LoginLoading) {
              isLoading = true;
            } else if (state is LoginSuccess) {
              isLoading = false;
              loginCubit.appPreferences.setUserLoggedIn(true);
              // navigate to home screen
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.homeRoute, (route) => false);
            } else if (state is LoginFailure) {
              isLoading = false;
              Fluttertoast.showToast(
                  msg: state.errorMsg,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: FontSize.s16.sp);
            } else if (state is LoginEmailValidationState) {
              emailErrorMsg = state.error;
              loginCubit.isAllValid(
                  _emailController.text, _passwordController.text);
            } else if (state is LoginPasswordValidationState) {
              passwordErrorMsg = state.error;
              loginCubit.isAllValid(
                  _emailController.text, _passwordController.text);
            } else if (state is LoginIsAllValidState) {
              isAllValid = state.isAllValid;
            }
          },
        ));
  }
}
