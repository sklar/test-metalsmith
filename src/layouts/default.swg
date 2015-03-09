<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta name="description" content="">
    <meta name="keywords" content="">

    <title>Metalsmith sandbox</title>

    {# <link rel="stylesheet" href="assets/css/main.min.css"> #}
</head>

<body>
    <div class="page">
        <header role="banner" class="page__head">
            <h1 class="page__head__logo">Metalsmith sandbox</h1>

            {% include '../partials/navigation.swg' %}
        </header>

        <main role="main" class="page__content">
            {% autoescape false %}
                {{ contents }}
            {% endautoescape %}
        </main>

        <footer role="contentinfo" class="page__foot">
            <hr class="lay-none">

            <h2>Footer</h2>

        </footer>
    </div>
    <!-- // lay-container -->

</body>
</html>
