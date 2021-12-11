from django.test import TestCase
from home.models import UserContact, UserFeedback, UserModel

# Create your tests here.


class TestClass(TestCase):

    @classmethod
    def setUpTestData(cls):
        UserModel.objects.create(name='Alice', email='alice@gmail.com')
        UserContact.objects.create(
            messengerName='Alice', messengerEmail='alice@gmail.com', message='Test Contact')
        UserFeedback.objects.create(
            messengerName='Alice', messengerEmail='alice@gmail.com', message='Test Feedback')

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
        contact = UserContact.objects.create(
            messengerName='Charlie', messengerEmail='charlie@gmail.com', message='Testing Contact')
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
        self.assertEqual(name, 'messengerName',
                         "Testing name in user feedback")

    def test_user_feedbackobject(self):
        feedback = UserFeedback.objects.create(
            messengerName='Charlie', messengerEmail='charlie@gmail.com', message='Testing Feedback')
        object_name = f'{feedback.messengerName}'
        object_email = f'{feedback.messengerEmail}'
        object_message = f'{feedback.message}'
        # print("Method: Checking/Matching name, email and message")
        self.assertEqual('Charlie', object_name, "Testing Name")
        self.assertEqual('charlie@gmail.com', object_email, "Testing Email")
        self.assertEqual('Testing Feedback',
                         object_message, "Testing Feedback")

    # def test_createRestaurant(self):
    #     res1 = Restaurant.objects.create(
    #         Rid=9, Rname='Burger Lab', Aname='Gulshan')
    #     res = Restaurant.objects.get(Rid=9)
    #     object1 = res.Rname
    #     print("Method: Creating object of Restaurant Class")
    #     self.assertEqual('Burger Lab', object1, "Testing Restaurant Name")
    #     self.assertNotEqual('Gulshan', object1, "Testing False Area Name")

    # def test_deleteRestaurant(self):
    #     res1 = Restaurant.objects.create(
    #         Rid=10, Rname='Burger Lab', Aname='Gulshan')
    #     res = Restaurant.objects.get(Rid=10)
    #     object1 = res.Rname
    #     print("Method: Deleting object of Restaurant Class")
    #     self.assertEqual('Burger Lab', object1, "Testing Restaurant Name")
    #     views.deleteRes1(10)
    #     self.assertNotEqual('Burger Lab', res1, "Deleting Restaurant Name")

    # def test_DublicateRestaurant(self):
    #     res1 = Restaurant.objects.create(Rid=10, Rname='KFC', Aname='Gulshan')
    #     object1 = res1.Rname
    #     print("Method: Checking Dublicate value")
    #     res2 = Restaurant.objects.create(Rid=11, Rname='KFC', Aname='Gulshan2')
    #     self.assertNotEqual('KFC', object1, "Dublicate Restaurant Name")

    # def setUp(self):
    #     print("setUp: Run once for every test method to setup clean data.")
    #     pass

    # def test_false_is_false(self):
    #     print("Method: test_false_is_false.")
    #     self.assertFalse(False)
