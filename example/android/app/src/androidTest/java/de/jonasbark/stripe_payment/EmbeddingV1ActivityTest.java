package de.jonasbark.stripe_payment;

import androidx.test.rule.ActivityTestRule;
import de.jonasbark.stripe_payment_example.EmbeddingV1Activity;
import dev.flutter.plugins.e2e.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;

@RunWith(FlutterTestRunner.class)
public class EmbeddingV1ActivityTest {

  @Rule
  public ActivityTestRule<EmbeddingV1Activity> rule =
      new ActivityTestRule<>(EmbeddingV1Activity.class);
}
