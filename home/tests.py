from django.test import TestCase
from home.models import BkashPayment, ClaimOwner, PostModel, UserContact, UserFeedback, UserModel

# Create your tests here.


class TestClass(TestCase):
 
    @classmethod
    def setUpTestData(cls):
        UserModel.objects.create(name='Alice', email='alice@gmail.com')
        UserContact.objects.create(messengerName='Alice', messengerEmail='alice@gmail.com', message='Test Contact')
        UserFeedback.objects.create( messengerName='Alice', messengerEmail='alice@gmail.com', message='Test Feedback')
        PostModel.objects.create(title='Test Title', description='Test Description', location='Test Location', lostDateTime='2022-01-01 03:22:00.000000')
        ClaimOwner.objects.create(claimerName='Alice', claimerEmail='alice@gmail.com')
        BkashPayment.objects.create( name='Alice', email='alice@gmail.com', bkashNumber='0123456789')

    def test_user_name(self):
        user = UserModel.objects.get(id=1)
        field_label = user._meta.get_field('name').verbose_name
        # print("Method: testing name field")
        self.assertEqual(field_label, 'name', "Testing name in user")

    def test_userobject_name_email(self):
        user = UserModel.objects.create(name='Bob', email='bob@gmail.com')
        object_name = f'{user.name}'
        object_email = f'{user.email}'
        # print("Method: Checking/Matching name and email")
        self.assertEqual('Bob', object_name, "Testing Name")
        self.assertEqual('bob@gmail.com', object_email, "Testing Email")

    def test_contact_user_name(self):
        user = UserContact.objects.get(id=1)
        name = user._meta.get_field('messengerName').verbose_name
        # print("Method: testing name field")
        self.assertEqual(name, 'messengerName', "Testing name in user contact")

    def test_user_contactobject(self):
        contact = UserContact.objects.create( messengerName='Charlie', messengerEmail='charlie@gmail.com', message='Testing Contact')
        object_name = f'{contact.messengerName}'
        object_email = f'{contact.messengerEmail}'
        object_message = f'{contact.message}'
        # print("Method: Checking/Matching name, email and message")
        self.assertEqual('Charlie', object_name, "Testing Name")
        self.assertEqual('charlie@gmail.com', object_email, "Testing Email")
        self.assertEqual('Testing Contact', object_message, "Testing Contact")

    def test_feedback_user_name(self):
        user = UserFeedback.objects.get(id=1)
        name = user._meta.get_field('messengerName').verbose_name
        # print("Method: testing name field")
        self.assertEqual(name, 'messengerName', "Testing name in user feedback")

    def test_user_feedbackobject(self):
        feedback = UserFeedback.objects.create(messengerName='Charlie', messengerEmail='charlie@gmail.com', message='Testing Feedback')
        object_name = f'{feedback.messengerName}'
        object_email = f'{feedback.messengerEmail}'
        object_message = f'{feedback.message}'
        # print("Method: Checking/Matching name, email and message")
        self.assertEqual('Charlie', object_name, "Testing Name")
        self.assertEqual('charlie@gmail.com', object_email, "Testing Email")
        self.assertEqual('Testing Feedback', object_message, "Testing Feedback")

    def test_user_post_title(self):
        post = PostModel.objects.get(id=1)
        title = post._meta.get_field('title').verbose_name
        # print("Method: testing title field")
        self.assertEqual(title, 'title', "Testing title in user posts")

    def test_user_postobject(self):
        post = PostModel.objects.create(title='Test Title', description='Test Description', location='Test Location', lostDateTime='2022-01-01 03:22:00.000000')
        object_title = f'{post.title}'
        object_description = f'{post.description}'
        object_location = f'{post.location}'
        # print("Method: Checking/Matching title, description and location")
        self.assertEqual('Test Title', object_title, "Testing Title")
        self.assertEqual('Test Description', object_description, "Testing Description")
        self.assertEqual('Test Location', object_location, "Testing Location")

    def test_claimer_name(self):
        claim = ClaimOwner.objects.get(id=1)
        field_label = claim._meta.get_field('claimerName').verbose_name
        # print("Method: testing claimerName field")
        self.assertEqual(field_label, 'claimerName',"Testing claimer name in claimOwner")

    def test_claimerobject_name_email(self):
        claim = ClaimOwner.objects.create(claimerName='Bob', claimerEmail='bob@gmail.com')
        object_name = f'{claim.claimerName}'
        object_email = f'{claim.claimerEmail}'
        # print("Method: Checking/Matching name and email")
        self.assertEqual('Bob', object_name, "Testing ClaimerName")
        self.assertEqual('bob@gmail.com', object_email, "Testing ClaimerEmail")

    def test_bkash_name(self):
        bkash = BkashPayment.objects.get(id=1)
        field_label = bkash._meta.get_field('name').verbose_name
        # print("Method: testing name field")
        self.assertEqual(field_label, 'name', "Testing name in bkash payment")

    def test_bkashobject_name_email(self):
        bkash = BkashPayment.objects.create(name='Bob', email='bob@gmail.com', bkashNumber='0123456789')
        object_name = f'{bkash.name}'
        object_email = f'{bkash.email}'
        # print("Method: Checking/Matching name and email")
        self.assertEqual('Bob', object_name, "Testing Name")
        self.assertEqual('bob@gmail.com', object_email, "Testing Email")

    # testing url
    def test_home_url_name(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
    
    def test_authenticate_url_name(self):
        response = self.client.get('/authenticate')
        self.assertEqual(response.status_code, 200)
    
    def test_privacy_url_name(self):
        response = self.client.get('/privacy-policy')
        self.assertEqual(response.status_code, 200)
    
    def test_terms_url_name(self):
        response = self.client.get('/terms-and-conditions')
        self.assertEqual(response.status_code, 200)

    
    # just for testing test class

    def setUp(self):
        print("setUp: Run once for every test method to setup clean data.")
        pass

    def test_false_is_false(self):
        print("Method: test_false_is_false.")
        self.assertFalse(False)
