class CompleteText {
  final String prompt;
  final String model;
  final double temperature;
  final int maxTokens;
  final double topP;
  final double frequencyPenalty;
  final double presencePenalty;
  final int n;
  final bool stream;

  /// ### example use it
  /// - ["You:"]
  ///Q: Who is Batman?
  ///A: Batman is a fictional comic book character.
  /// - Chat bot
  /// [" Human:", " AI:"]
  final List<String>? stop;

  CompleteText({
    required this.prompt,
    required this.model,
    this.temperature = .3,
    this.maxTokens = 100,
    this.topP = 1.0,
    this.frequencyPenalty = .0,
    this.presencePenalty = .0,
    this.stop,
    this.n = 1,
    this.stream = true,
  });

  factory CompleteText.fromJson(Map<String, dynamic> json) => CompleteText(
        prompt: json['prompt'] as String,
        model: json['model'] as String,
        temperature: (json['temperature'] as num?)?.toDouble() ?? .3,
        maxTokens: json['max_tokens'] as int? ?? 100,
        topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
        frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble() ?? .0,
        presencePenalty: (json['presence_penalty'] as num?)?.toDouble() ?? .0,
      );
  Map<String, dynamic> toJson() => _CompleteReqToJson(this);

  Map<String, dynamic> _CompleteReqToJson(CompleteText instance) =>
      <String, dynamic>{
        'prompt': instance.prompt,
        'model': instance.model,
        'temperature': instance.temperature,
        'max_tokens': instance.maxTokens,
        'top_p': instance.topP,
        'frequency_penalty': instance.frequencyPenalty,
        'presence_penalty': instance.presencePenalty,
        "stop": instance.stop,
        "n": instance.n,
        "stream": instance.stream
      };
}
