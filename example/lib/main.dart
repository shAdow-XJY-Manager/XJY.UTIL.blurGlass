import 'package:flutter/material.dart';
import 'package:blur_glass/blur_glass.dart';

void main() => runApp(const MyApp());
ThemeData _theme() => ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF111315),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFD6EF36),
    onPrimary: Color(0xFF111315),
    secondary: Color(0xFFFFB23F),
    surface: Color(0xFF1B1E20),
    onSurface: Color(0xFFF4F2E9),
    outline: Color(0xFF41484B),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Blur Glass 演示',
    theme: _theme(),
    home: const MyHomePage(),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _blur = 10;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Blur Glass · 玻璃表面')),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('拖动滑块，对比模糊强度。组件沿用宿主主题，正文保持清晰。'),
              const SizedBox(height: 24),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF526119), Color(0xFF794817)],
                  ),
                ),
                child: BlurGlass(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(24),
                  filterX: _blur,
                  filterY: _blur,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.blur_on, size: 48),
                      SizedBox(height: 16),
                      Text('局部玻璃 · 清晰内容'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text('当前模糊强度：${_blur.round()}'),
              Slider(
                value: _blur,
                min: 0,
                max: 20,
                divisions: 20,
                label: '${_blur.round()}',
                onChanged: (value) => setState(() => _blur = value),
              ),
              OutlinedButton(
                onPressed: () => setState(() => _blur = 10),
                child: const Text('重置为 10'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
