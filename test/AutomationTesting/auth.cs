using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System.Threading;
namespace AutomationTesting;

public class auth
{
    private IWebDriver driver;

    [SetUp]
    public void Setup()
    {
         driver = new ChromeDriver();
    }

    [Test]
    public void Login()
    {
        driver.Navigate().GoToUrl("https://pegi.vercel.app/");

        Thread.Sleep(7000);
        var loginButton = driver.FindElement(By.Id("login"));
        loginButton.Click();
        Thread.Sleep(2000);
        var userName = driver.FindElement(By.Name("user"));
        userName.SendKeys("mau");
        Thread.Sleep(2500);
        var password = driver.FindElement(By.Name("password"));
        password.SendKeys("mau");
        Thread.Sleep(2500);
        var sendButton = driver.FindElement(By.Id("send"));
        sendButton.Click();
        Thread.Sleep(3500);

        //enter data to a cv
        var cvButton = driver.FindElement((By.Id("cv")));
        cvButton.Click();
        Thread.Sleep(2500);


        IWebElement radioGroup = driver.FindElement(By.Id("radiogroup"));
        IList<IWebElement> radioButtons = radioGroup.FindElements(By.TagName("input"));

        IWebElement cedulaRadioButton = radioButtons.FirstOrDefault(rb => rb.GetAttribute("value") == "CC");

        if (cedulaRadioButton.Displayed && cedulaRadioButton.Enabled)
        {
            cedulaRadioButton.Click();
        }
        else
        {
            // Esperar un poco y volver a intentar hacer clic en el elemento
            Thread.Sleep(1000);
            cedulaRadioButton.Click();
        }
        Thread.Sleep(2500);

        driver.Close();

        Assert.Pass();
    }

    [Test]
    public void cv()
    {
        driver.Navigate().GoToUrl("https://pegi.vercel.app/");

        Thread.Sleep(7000);
        var loginButton = driver.FindElement(By.Id("login"));
        loginButton.Click();
        Thread.Sleep(2000);
        var userName = driver.FindElement(By.Name("user"));
        userName.SendKeys("mau");
        Thread.Sleep(2500);
        var password = driver.FindElement(By.Name("password"));
        password.SendKeys("mau");
        Thread.Sleep(2500);
        var sendButton = driver.FindElement(By.Id("send"));
        sendButton.Click();
        Thread.Sleep(3500);

        //enter data to a cv
        var cvButton = driver.FindElement((By.Id("cv")));
        cvButton.Click();
        Thread.Sleep(2500);


        var radioGroup = driver.FindElement(By.Id("radiogroup"));
        IList<IWebElement> radioButtons = radioGroup.FindElements(By.TagName("input"));

        var cedulaRadioButton = radioButtons.FirstOrDefault(rb => rb.GetAttribute("value") == "CC");


       Console.WriteLine(cedulaRadioButton.Selected);
       // cedulaRadioButton.Click();
        Thread.Sleep(2500);

        var document = driver.FindElement(By.Name("document"));
        document.SendKeys("1067590360");
        Thread.Sleep(2500);
        var firstName = driver.FindElement((By.Name("firstName")));
        firstName.SendKeys("Mauricio");
        Thread.Sleep(2500);
        var secondName = driver.FindElement((By.Name("secondName")));
        secondName.SendKeys("Santiago");
        Thread.Sleep(2500);
        var firstLastName = driver.FindElement((By.Name("firstLastName")));
        firstLastName.SendKeys("Avendaño");
        Thread.Sleep(2500);
        var secondLastName = driver.FindElement((By.Name("secondLastName")));
        secondLastName.SendKeys("Gomez");
        Thread.Sleep(2500);
        //var civilState = driver.FindElement(By.Id("civilState"));
        //if (!civilState.Selected)
        //{
        //    civilState.Click();
        //}
        //Thread.Sleep(2500);
        //var sexo = driver.FindElement(By.Id("sexo"));
        //if (!sexo.Selected)
        //{
        //     sexo.Click();
        // }
        //Thread.Sleep(2500);
        var birthDate = driver.FindElement(By.Name("birthDate"));
        birthDate.Clear();
        birthDate.SendKeys("01/01/2022");
        Thread.Sleep(2500);
        var phone = driver.FindElement((By.Name("phone")));
        phone.SendKeys("3015849730");
        Thread.Sleep(2500);
        var institutionalMail = driver.FindElement((By.Name("institutionalMail")));
        institutionalMail.SendKeys("mauricio@unicesar.edu.co");
        Thread.Sleep(6500);

        driver.Close();

        Assert.Pass();

    }

}
